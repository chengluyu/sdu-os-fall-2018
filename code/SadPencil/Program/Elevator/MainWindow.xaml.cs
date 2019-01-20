using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Elevator
{
    /// <summary>
    /// MainWindow.xaml 的交互逻辑
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            this.InitializeComponent();
            this.RequestLinkedList.ItemsSource = this.Requests;
        }

        /// <summary>
        /// 已添加、未处理的请求
        /// </summary>
        public ObservableCollection<Request> Requests = new ObservableCollection<Request>();
        /// <summary>
        /// 待添加的请求
        /// </summary>
        public List<Request> IncomingRequests = new List<Request>();

        /// <summary>
        /// 指示当前步进正在添加的请求
        /// </summary>
        private Request ProceedingRequest = null;
        /// <summary>
        /// 指示当前是否恰好完成了一次添加请求，只有为 True 时可以处理请求
        /// </summary>
        private bool Atomic = true;
        /// <summary>
        /// 用来控制步进
        /// </summary>
        private IEnumerator<int> StepInEnumerator;

        private void LoadRequestButton_Click(object sender, RoutedEventArgs e)
        {
            Microsoft.Win32.OpenFileDialog openFileDialog = new Microsoft.Win32.OpenFileDialog()
            {
                Filter = "*.json|*.json",
                Multiselect = false
            };
            if (openFileDialog.ShowDialog().GetValueOrDefault())
            {
                using (System.IO.StreamReader reader = System.IO.File.OpenText(openFileDialog.FileName))
                {
                    var list = Newtonsoft.Json.JsonConvert.DeserializeObject<List<RequestJSON>>(reader.ReadToEnd());
                    foreach (var item in list)
                    {
                        this.IncomingRequests.Add(new Request() { BorderColor = "Black", ReadOrWrite = (item.cmd == 0 ? "Read" : "Write"), StartSector = item.sector, SectorCount = item.nr_sectors });
                    }
                }
                this.LoadRequestButton.IsEnabled = false;
                this.ProceedRequestButton.IsEnabled = true;
                this.NextStepButton.IsEnabled = true;
            }
        }

        private void ProceedRequestButton_Click(object sender, RoutedEventArgs e)
        {
            if (this.Atomic)
            {
                if (this.Requests.Count > 0)
                {
                    this.Requests.RemoveAt(0);
                }
            }
            else
            {
                MessageBox.Show("请先完成本次添加请求的步进。","原子操作",MessageBoxButton.OK,MessageBoxImage.Exclamation);
            }
        }


        private IEnumerable<int> StepIn()
        {
            while (this.IncomingRequests.Count > 0)
            {
                System.Diagnostics.Debug.Assert(this.ProceedingRequest == null);
                this.Atomic = false;
                this.ProceedingRequest = this.IncomingRequests.First();
                this.IncomingRequests.RemoveAt(0);

                if (this.Requests.Count == 0)
                {
                    this.Requests.Add(this.ProceedingRequest);
                }
                else
                {
                    int i = 0;
                    for (; i < this.Requests.Count - 1; ++i)
                    {
                        this.Requests[i].BorderColor = "Crimson";
                        yield return i;
                        this.Requests[i].BorderColor = "Black";
                        if ((this.Requests[i] < this.ProceedingRequest || this.Requests[i] >= this.Requests[i + 1]) && (this.ProceedingRequest < this.Requests[i + 1]))
                        {
                            break;
                        }
                    }
                    this.Requests[i].BorderColor = "Blue";
                    yield return i;
                    this.Requests[i].BorderColor = "Black";
                    //插到i后面，i+1前面
                    this.Requests.Insert(i + 1, this.ProceedingRequest);
                }
                this.ProceedingRequest.BorderColor = "Purple";
                this.Atomic = true;
                yield return 0;
                this.ProceedingRequest.BorderColor = "Black";
                this.ProceedingRequest = null;
            }
        }

        private void NextStepButton_Click(object sender, RoutedEventArgs e)
        {
            if (this.IncomingRequests.Count > 0)
            {
                if (this.StepInEnumerator == null)
                {
                    this.StepInEnumerator = this.StepIn().GetEnumerator();
                }
                this.StepInEnumerator.MoveNext();
            }
        }
    }
}
