<style>
  #mainview {
    margin: 30px 0 30px 0;
    min-height: 28cm;
  }

  #upper {
    margin: 0 0 20px 0;
    height: 100%;
  }

  #leftarea {
    float: left;
    width: 35%;
    height: 24cm;
  }

  #codeview {
    border: aliceblue;
    width: 100%;
    height: 70%;
  }

  #logger {
    margin-top: 20px;
    height: 30%;
    width: 100%;
  }

  #codeselecter {
    float: left;
    width: 20%;
    height: 100%;
    outline: slategrey;
  }

  #codecontent {
    float: left;
    width: 80%;
    height: 100%;
    overflow: scroll;
    background-color: #dcdee2;
  }

  #monitor {
    width: 65%;
    height: auto;
    float: left;
    text-align: center;
  }

  #register {
    display: table;
    margin: 0 auto;
  }

  #c1 {
    float: left;
    margin: 0 5px 0 5px;
  }

  #c2 {
    float: left;
    margin: 0 5px 0 5px;
  }

  #c3 {
    float: left;
    margin: 0 5px 0 5px;
  }


  #ramusage {
    display: table;
    height: 2cm;
    width: 80%;
    margin: 0 auto;

  }

  #diskusage {
    display: table;
    margin: 0 auto;
  }

  #disk {
    float: left;
    width: 600px;
    height: 60px;
    margin: 30px 0 30px 20px;
  }

  #circle {
    float: left;
  }

  #interruptres{
    margin: 0 8% 80px 12%;
  }

  #buttonbar {
    margin-bottom: 10px;
    width: 100%;
  }

  .layout {
    border: 1px solid #d7dde4;
    background: #f5f7f9;
    position: relative;
    border-radius: 4px;
    overflow: hidden;

  }

  .layout-logo {
    width: 150px;
    height: 30px;
    background: #5b6270;
    border-radius: 3px;
    float: left;
    position: relative;
    top: 15px;
    left: 20px;
    text-align: center;
    line-height: 30px;
    font-weight: bold;
    color: aliceblue;
  }

  .layout-nav {
    float: right;
    margin: 0 auto;
    margin-right: 20px;
  }

  .layout-footer-center {
    text-align: center;
    background-color: #515a6e;
    color: whitesmoke;
  }

  .noselect {
    -webkit-touch-callout: none; /* iOS Safari */
    -webkit-user-select: none; /* Safari */
    -khtml-user-select: none; /* Konqueror HTML */
    -moz-user-select: none; /* Firefox */
    -ms-user-select: none; /* Internet Explorer/Edge */
    user-select: none;
    /* Non-prefixed version, currently
                                     supported by Chrome and Opera */
  }

  h2 {
    margin: 10px 0 10px 0;
  }
</style>
<template>
  <div class="layout">
    <Layout>
      <Header>
        <Menu mode="horizontal" theme="dark" active-name="headernav" class="noselect">
          <div class="layout-logo">
            <h3>操作系统可视化</h3>
          </div>
          <div class="layout-nav">
            <router-link to="/">
              <MenuItem name="main">
                <Icon type="md-desktop"></Icon>
                可视化
              </MenuItem>
            </router-link>
            <router-link to="/datas">
              <MenuItem name="Datas">
                <Icon type="md-eye"></Icon>
                查看数据
              </MenuItem>
            </router-link>
            <router-link to="/about">
              <MenuItem name="about">
                <Icon type="ios-information-circle-outline"></Icon>
                关于
              </MenuItem>
            </router-link>
          </div>
        </Menu>
      </Header>
      <Content :style="{padding: '0 50px'}">
        <div id="mainview">
          <div id="upper">
            <div id="leftarea">
              <div id="buttonbar">
                <ButtonGroup shape="circle" style="margin: 0 auto; display: table">
                  <Button type="default" icon="ios-skip-backward" @click="lastStep"></Button>
                  <Button type="default" icon="ios-play" v-bind:icon="iconStatus" @click="start"></Button>
                  <Button type="default" icon="ios-skip-forward" @click="nextStep"></Button>
                </ButtonGroup>
              </div>
              <div id="codeview">
                <div id="codeselecter" class="noselect">
                  <Menu theme="dark" width="auto" style="height: 100%">
                    <MenuItem name="bios" @click.native="getContent('BIOS')">
                      BIOS
                    </MenuItem>
                    <MenuItem name="bootsectcode" @click.native="getContent('bootsect.S')">
                      bootsect.S
                    </MenuItem>
                    <MenuItem name="setupcode" @click.native="getContent('setup.S')">
                      setup.S
                    </MenuItem>
                    <MenuItem name="headcode" @click.native="getContent('head.S')">
                      head.S
                    </MenuItem>
                  </Menu>
                </div>
                <div id="codecontent">
                   <pre v-highlightjs="content"
                        style="background-color: rgba(0, 0, 0, 0);color: #444444;overflow: visible; height: auto">
                  <code class=""
                        style="background-color: rgba(0, 0, 0, 0);color: #444444;overflow: visible; height: auto"></code>
                </pre>
                </div>
              </div>
              <div id="logger">
                <Tabs value="name1" style="width: 100%; height: 100%">
                  <TabPane label="运行状态" name="name1">
                    <div id="loggerbar"
                         style="width: 100%; height: 10%; background:rgba(0, 0, 0, 0.2);">
                      <img src="./../assets/images/console.svg" alt="console" style="height: 100%; width: auto">
                    </div>
                    <textarea id="loggercontent" readonly="readonly"
                              style="width: 100%; height: 90%; background-color: black; color: white; resize:none; ">{{logs}}
                    </textarea>
                  </TabPane>
                  <TabPane label="显示器" name="name2">
                    <div id="monibar"
                         style="width: 100%; height: 10%; background:rgba(0, 0, 0, 0.2);">
                      <img src="./../assets/images/console.svg" alt="console" style="height: 100%; width: auto">
                    </div>
                    <textarea id="monicontent"
                              style="width: 100%; height: 90%; background-color: black; color: white; resize:none; ">{{moni}}
                    </textarea>
                  </TabPane>
                </Tabs>

              </div>
            </div>
            <div id="monitor">
              <h2>寄存器数据</h2>
              <div id="register">
                <div id="c1">
                  <Table width="210" border stripe :columns="columns1" :data="data1"></Table>
                </div>
                <div id="c2">
                  <Table width="210" border stripe :columns="columns2" :data="data2"></Table>
                </div>
                <div id="c3">
                  <Table width="210" border stripe :columns="columns3" :data="data3"></Table>
                </div>
              </div>
              <h2 style="margin-top: 20px">内存使用情况</h2>
              <div id="ramusage">
                <Tooltip placement="top" theme="dark" v-for="item in rams" style="float: left; height: 100%;"
                         :style="{width: item.size, backgroundColor: item.color}" :key="item.name">
                  <div slot="content">
                    <h3>{{item.name}}</h3>
                    <p><span>{{item.addr}}</span></p>
                  </div>
                </Tooltip>
              </div>
              <h2 style="margin-top: 30px; margin-bottom: 5px">磁盘状态</h2>
              <div id="diskusage">
                <div id="circle">
                  <Circle :percent="percent" :stroke-color="color">
                    <Icon v-if="percent == 100" type="ios-checkmark" size="60" style="color:#5cb85c"></Icon>
                    <span v-else style="font-size:24px">{{ percent }}%</span>
                  </Circle>
                </div>
                <div id="disk">
                  <Tooltip v-bind:style="bootborder" placement="top" content="boot扇区"
                           style="background-color: #808695; width: 9.5%; height: 100%; float: left;"></Tooltip>
                  <Tooltip v-bind:style="setupborder" placement="top" content="setup模块"
                           style="background-color: #2d8cf0; width: 39.5%; height: 100%; float:left;"></Tooltip>
                  <Tooltip v-bind:style="systemborder" placement="top" content="system模块"
                           style="background-color: #19be6b; width: 49.5%; height: 100%; float:left;"></Tooltip>
                </div>
              </div>

              <h2 style="margin-top: 30px; margin-bottom: 5px">中断返回内容</h2>
              <div id="interruptres">
                <Table border stripe :columns="intcolumn" :data="intdata">
                </Table>
              </div>
            </div>

          </div>
        </div>
      </Content>
      <Footer class="layout-footer-center">2018 Copyright &copy; AiHxym</Footer>
    </Layout>
  </div>
</template>
<script>
  import datas from '@/assets/mock/data.json';
  import Vue from 'vue';

  var mainproc;
  export default {
    data() {
      return {
        moni: "",
        logs: "",
        iconStatus: "ios-play",
        percent: 0,
        content: "",
        rams: [],
        now: {
          index: 0,
          number: 0,
        },
        columns1: [
          {
            title: 'Name',
            key: 'name'
          },
          {
            title: 'Value',
            key: 'value'
          }
        ],
        data1: [
          {
            name: 'EAX',
            value: '0'
          },
          {
            name: 'EBX',
            value: '0'
          },
          {
            name: 'ECX',
            value: '0'
          },
          {
            name: 'EDX',
            value: '0'
          }
        ],
        columns2: [
          {
            title: 'Name',
            key: 'name'
          },
          {
            title: 'Value',
            key: 'value'
          }
        ],
        data2: [
          {
            name: 'DS',
            value: '0'
          },
          {
            name: 'ES',
            value: '0'
          },
          {
            name: 'SS',
            value: '0'
          },
          {
            name: 'SP',
            value: '0'
          }
        ],
        columns3: [
          {
            title: 'Name',
            key: 'name'
          },
          {
            title: 'Value',
            key: 'value'
          }
        ],
        data3: [
          {
            name: 'DI',
            value: '0'
          },
          {
            name: 'SI',
            value: '0'
          },
          {
            name: 'PC',
            value: '0'
          }
        ],
        intcolumn: [
          {
            title: '参数',
            key: 'name'
          },
          {
            title: '内容',
            key: 'value'
          },
          {
            title: '说明',
            key: 'description'
          }
        ],
        intdata: [],
        bootborder: "",
        setupborder: "",
        systemborder: "",
      }
    },
    computed: {
      color() {
        let color = '#2db7f5';
        if (this.percent === 100) {
          color = '#5cb85c';
        }
        return color;
      }
    },
    methods: {
      getContent(name) {
        this.content = datas.code.find(e => e.name === name).content;
        if (name === "BIOS") {
          this.now.index = 0;
          this.now.number = 0;
        } else if (name === "bootsect.S") {
          this.now.index = 1;
          this.now.number = 0;
        } else if (name === "setup.S") {
          this.now.index = 2;
          this.now.number = 0;
        } else if (name === "head.S") {
          this.now.index = 3;
          this.now.number = 0;
        }
      }
      ,
      add() {
        if (this.percent >= 100) {
          return false;
        }
        this.percent += 1;
      }
      ,
      start() {
        if (this.iconStatus === "ios-pause") {
          this.iconStatus = "ios-play";
          clearInterval(mainproc);
        } else {
          this.iconStatus = "ios-pause";
          this.content = "";
          clearInterval(mainproc);
          if (this.now.index === 1) {
            if (this.now.number < datas.events.bootsect.length) {
              this.parseEvent(1, this.now.number);
              ++this.now.number;
            }
          }
          mainproc = setInterval(() => {
            if (this.now.index === 1) {
              if (this.now.number < datas.events.bootsect.length) {
                this.parseEvent(1, this.now.number);
                ++this.now.number;
              } else {
                ++this.now.index;
              }
            }
          }, 8000);
        }
      }
      ,
      nextStep() {
        this.content = "";
        if (this.now.index === 0) {
          if (this.now.number < datas.events.BIOS.length) {
            this.parseEvent(0, this.now.number);
            ++this.now.number;
          } else {
            this.now.index = 1;
            this.now.number = 1;
            this.parseEvent(1, 0);
          }
        } else if (this.now.index === 1) {
          if (this.now.number < datas.events.bootsect.length) {
            this.parseEvent(1, this.now.number);
            ++this.now.number;
          } else {
            this.now.index = 2;
            this.now.number = 1;
            this.parseEvent(2, 0);
          }
        } else if (this.now.index === 2) {
          if (this.now.number < datas.events.setup.length) {
            this.parseEvent(2, this.now.number);
            ++this.now.number;
          } else {
            this.now.index = 3;
            this.now.number = 1;
            this.parseEvent(3, 0);
          }
        } else if (this.now.index === 3) {
          if (this.now.number < datas.events.head.length) {
            this.parseEvent(3, this.now.number);
            ++this.now.number;
          } else {
            this.now.index = 0;
            this.now.number = 0;
            this.messageBox("提示", "已运行至结尾");
          }
        }
      },
      lastStep() {
        this.content = "";
        if (this.now.index === 0) {
          if (this.now.number - 1 >= 0) {
            this.parseEvent(0, this.now.number - 1);
            --this.now.number;
          } else {
            this.now.index = 0;
            this.now.number = 0;
            this.messageBox("提示", "已经在最开始部分");
          }
        } else if (this.now.index === 1) {
          if (this.now.number - 1 >= 0) {
            this.parseEvent(1, this.now.number - 1);
            --this.now.number;
          } else {
            this.now.index = 0;
            this.now.number = datas.events.BIOS.length - 1;
            this.parseEvent(0, this.now.number);
          }
        } else if (this.now.index === 2) {
          if (this.now.number - 1 >= 0) {
            this.parseEvent(2, this.now.number - 1);
            --this.now.number;
          } else {
            this.now.index = 1;
            this.now.number = datas.events.bootsect.length - 1;
            this.parseEvent(1, this.now.number - 1);
          }
        } else if (this.now.index === 3) {
          if (this.now.number - 1 >= 0) {
            this.parseEvent(3, this.now.number - 1);
            --this.now.number;
          } else {
            this.now.index = 2;
            this.now.number = datas.events.setup.length - 1;
            this.parseEvent(1, this.now.number);
          }
        }
      },
      parseEvent(index, number) {
        var event;
        if (index === 0){
          event = datas.events.BIOS[number];
        } else if (index === 1) {
          event = datas.events.bootsect[number];
        } else if (index === 2) {
          event = datas.events.setup[number];
        } else if (index === 3) {
          event = datas.events.head[number];
        }
        if (event.isInterrupt === true) {
          this.messageBox("触发中断或提示", event.interruptContent);
          this.intdata = event.intdata;
        }
        if (event.isChangeRegister === true) {
          this.setRegisters(event);
        }
        if (event.isReadDisk === true) {
          this.readDisk(event);
        } else {
          this.setRam(event);
        }

        this.logs = event.console;
        this.moni += event.moni;
      }
      ,
      readDisk(event) {
        if (event.readPlace === "boot") {
          this.bootborder = "border: 2px solid red";
          var tmp = setInterval(() => {
            if (this.add() === false) {
              setTimeout(() => this.percent = 0, 500);
              setTimeout(() => this.setRam(event), 200);
              this.bootborder = "";
              clearInterval(tmp);
            }
          }, 80);
        } else if (event.readPlace === "setup") {
          this.setupborder = "border: 2px solid red";
          var tmp = setInterval(() => {
            if (this.add() === false) {
              setTimeout(() => this.percent = 0, 500);
              setTimeout(() => this.setRam(event), 200);
              this.setupborder = "";
              clearInterval(tmp);
            }
          }, 80);

        } else if (event.readPlace === "system") {
          this.systemborder = "border: 2px solid red";
          var tmp = setInterval(() => {
            if (this.add() === false) {
              setTimeout(() => this.percent = 0, 500);
              setTimeout(() => this.setRam(event), 200);
              this.systemborder = "";
              clearInterval(tmp);
            }
          }, 80);
        } else{
          var tmp = setInterval(() => {
            if (this.add() === false) {
              setTimeout(() => this.percent = 0, 500);
              setTimeout(() => this.setRam(event), 200);
              this.systemborder = "";
              clearInterval(tmp);
            }
          }, 80);
        }
      }
      ,
      setRam(event) {
        this.rams = [];
        for (let i in event.ram) {
          Vue.set(this.rams, i, event.ram[i]);
        }
        if (event.isCarry === true) {
          var cnt = 1;
          var decrease = parseInt(event.ram[event.carry.from].size) / event.carry.times;
          var tmp = setInterval(() => {
            if (cnt >= event.carry.times) {
              clearInterval(tmp);
            }
            let size = (parseFloat(this.rams[event.carry.from - 1].size) + decrease).toString() + '%';
            Vue.set(this.rams, event.carry.from - 1, {
              "size": size,
              "name": this.rams[event.carry.from - 1].name,
              "addr": this.rams[event.carry.from - 1].addr,
              "color": this.rams[event.carry.from - 1].color
            });
            size = (parseFloat(this.rams[event.carry.from].size) - decrease).toString() + '%';
            Vue.set(this.rams, event.carry.from, {
              "size": size,
              "name": this.rams[event.carry.from].name,
              "addr": this.rams[event.carry.from].addr,
              "color": this.rams[event.carry.from].color
            });
            size = (parseFloat(this.rams[event.carry.to + 1].size) - decrease).toString() + '%';
            Vue.set(this.rams, event.carry.to + 1, {
              "size": size,
              "name": this.rams[event.carry.to + 1].name,
              "addr": this.rams[event.carry.to + 1].addr,
              "color": this.rams[event.carry.to + 1].color
            });
            size = (parseFloat(this.rams[event.carry.to].size) + decrease).toString() + '%';
            Vue.set(this.rams, event.carry.to, {
              "size": size,
              "name": this.rams[event.carry.to].name,
              "addr": this.rams[event.carry.to].addr,
              "color": this.rams[event.carry.to].color
            });
            cnt += 1;
          }, 10);
        }
      }
      ,
      setRegisters(event) {
        if (event.isChangeRegister === true) {
          for (let i in event.registers) {
            var inx = 0;
            if ((inx = this.data1.findIndex((e) => {
                return e.name === event.registers[i].name;
              }
            )) !== -1) {
              this.data1[inx].value = event.registers[i].value;
            } else if ((inx = this.data2.findIndex((e) => {
                return e.name === event.registers[i].name;
              }
            )) !== -1) {
              this.data2[inx].value = event.registers[i].value;
            } else if ((inx = this.data3.findIndex((e) => {
                return e.name === event.registers[i].name;
              }
            )) !== -1) {
              this.data3[inx].value = event.registers[i].value;
            }
          }
        }
      }
      ,
      messageBox(title, content) {
        this.$Modal.info({
          title: title,
          content: content
        });
      }
    }
  }
</script>
