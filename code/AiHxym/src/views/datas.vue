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
      <Content style="padding: 30px 50px 30px 50px; min-height: 1000px">
        <div>
          <JsonView :json="JsonData"></JsonView>
        </div>
      </Content>
      <Footer class="layout-footer-center">2018 Copyright &copy; AiHxym</Footer>
    </Layout>
  </div>
</template>

<script>
  import JsonView from '@/components/JsonView'
  import datas from '@/assets/mock/data.json'

  export default {
    data() {
      return {
        JsonData: datas.events
      }
    },
    components: {JsonView}
  }
</script>
