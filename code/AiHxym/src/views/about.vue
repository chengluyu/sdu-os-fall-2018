<style>
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

  .time{
    font-size: 14px;
    font-weight: bold;
  }
  .content{
    padding-left: 5px;
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
      <Content style="padding: 30px 30% 30px 40%; min-height: 1000px">
        <div>
          <h1 style="margin-bottom: 30px">制作人：</h1>
          <h3>组长：薛雨萌</h3>
          <br>
          <h3>成员：薛雨萌</h3>
          <br>
          <h3>数据组：薛雨萌</h3>
          <br>
          <h3>可视化组：薛雨萌</h3>
          <br><br>
          <h1 style="margin-bottom: 50px">开发经历</h1>
          <Timeline>
            <TimelineItem color="green">前五周，阅读相关代码，分析如何提取数据</TimelineItem>
            <TimelineItem color="green">第六周，学习unity并制作了开机用到的模型</TimelineItem>
            <TimelineItem color="red">第七周，尝试各种提取数据的方法，均失败</TimelineItem>
            <TimelineItem color="green">第八周，了解开机部分数据只能手动调试，尝试手动在bochs里调试</TimelineItem>
            <TimelineItem color="green">第九周，搭建好了unity场景，提取完毕数据</TimelineItem>
            <TimelineItem color="green">第十周，开始了数据传输部分，尝试通过UGUI来实现可视化进入bootsect之后的部分</TimelineItem>
            <TimelineItem color="green">第十一周，将提取的数据完整打包成JSON</TimelineItem>
            <TimelineItem color="red">第十二周，UGUI开发效率太低，可视化效果较差，尝试其他方案</TimelineItem>
            <TimelineItem color="green">第十三周，改用web制作，克服了之前的问题</TimelineItem>
            <TimelineItem color="green">第十四周，可视化部分基本制作完毕</TimelineItem>
            <TimelineItem color="blue">制作完毕，上线</TimelineItem>
          </Timeline>。
        </div>
      </Content>
      <Footer class="layout-footer-center">2018 Copyright &copy; AiHxym</Footer>
    </Layout>
  </div>
</template>

<script>

  export default {
    data() {
      return {
      }
    },
  }
</script>
