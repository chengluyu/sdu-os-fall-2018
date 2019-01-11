using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;

namespace Elevator
{
    public class Request : INotifyPropertyChanged
    {
        private int startSector;
        public int StartSector {
            get { return this.startSector; }
            set {
                this.startSector = value;
                this.PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("StartSector"));

            }
        }

        private int sectorCount;
        public int SectorCount {
            get { return this.sectorCount; }
            set {
                this.sectorCount = value;
                this.PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("SectorCount"));
            }
        }

        private int readOrWrite;
        public string ReadOrWrite {
            get { return (this.readOrWrite == 0 ? "Read" : "Write"); }
            set {
                this.readOrWrite = (value == "Read" ? 0 : 1);
                this.PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("ReadOrWrite"));
            }
        }

        private string borderColor;
        public string BorderColor {
            get { return this.borderColor; }
            set {
                this.borderColor = value;
                this.PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("BorderColor"));
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;

        public static bool operator <(Request a, Request b)
        {
            return a.readOrWrite < b.readOrWrite || a.readOrWrite == b.readOrWrite && a.startSector < b.startSector;
        }
        public static bool operator >(Request a, Request b)
        {
            return a.readOrWrite > b.readOrWrite || a.readOrWrite == b.readOrWrite && a.startSector > b.startSector;
        }
        public static bool operator <=(Request a, Request b)
        {
            return !(a > b);
        }
        public static bool operator >=(Request a, Request b)
        {
            return !(a < b);
        }
    }
}
