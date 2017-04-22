<template>
    <div class="sidebar">
        <el-menu :default-active="onRoutes" class="el-menu-vertical-demo" theme="dark" unique-opened router>
            <el-submenu index="1">
                <template slot="title"><i class="el-icon-menu"></i>用户管理</template>
                <el-menu-item index="manager">管理员</el-menu-item>
                <el-menu-item index="user">用户</el-menu-item>
            </el-submenu>

            <el-submenu index="2">
                <template slot="title"><i class="el-icon-setting"></i>首页设置</template>
                <el-menu-item index="slider">幻灯片</el-menu-item>
                <el-menu-item index="classify">分类</el-menu-item>
                <el-menu-item index="sale">特价展示</el-menu-item>
                <el-menu-item index="show">推荐商品</el-menu-item>
            </el-submenu>

            <el-menu-item index="goods">
                <i class="el-icon-star-on"></i>商品管理
            </el-menu-item>

            <el-menu-item index="order">
                <i class="el-icon-check"></i>订单管理
            </el-menu-item>


            <!-- <el-menu-item index="readme">
                <i class="el-icon-setting"></i>自述
            </el-menu-item>
            <el-submenu index="5">
                <template slot="title"><i class="el-icon-menu"></i>表格</template>
                <el-menu-item index="basetable">基础表格</el-menu-item>
                <el-menu-item index="vuetable">Vue表格组件</el-menu-item>
            </el-submenu>
            <el-submenu index="3">
                <template slot="title"><i class="el-icon-date"></i>表单</template>
                <el-menu-item index="baseform">基本表单</el-menu-item>
                <el-menu-item index="vueeditor">编辑器</el-menu-item>
                <el-menu-item index="markdown">markdown</el-menu-item>
                <el-menu-item index="upload">文件上传</el-menu-item>
            </el-submenu>
            <el-submenu index="4">
                <template slot="title"><i class="el-icon-star-on"></i>图表</template>
                <el-menu-item index="basecharts">基础图表</el-menu-item>
                <el-menu-item index="mixcharts">混合图表</el-menu-item>
            </el-submenu> -->
        </el-menu>
    </div>
</template>

<script>
    export default {
        computed:{
            onRoutes(){
                return this.$route.path.replace('/','');
            }
        }
    }
</script>

<style scoped>
    .sidebar{
        display: block;
        position: absolute;
        width: 220px;
        left: 0;
        top: 70px;
        bottom:0;
        background: #2E363F;
    }
    .sidebar > ul {
        height:100%;
    }
</style>
