import Vue from 'vue';
import Router from 'vue-router';

Vue.use(Router);

export default new Router({
    routes: [
        {
            path: '/',
            redirect: '/login'
        },
        {
            path: '/readme',
            component: resolve => require(['../components/common/Home.vue'], resolve),
            children:[
                // {
                //     path: '/',
                //     component: resolve => require(['../components/page/Readme.vue'], resolve)
                // },
                // {
                //     path: '/basetable',
                //     component: resolve => require(['../components/page/BaseTable.vue'], resolve)
                // },
                // {
                //     path: '/vuetable',
                //     component: resolve => require(['../components/page/VueTable.vue'], resolve)     // vue-datasource组件
                // },
                // {
                //     path: '/baseform',
                //     component: resolve => require(['../components/page/BaseForm.vue'], resolve)
                // },
                // {
                //     path: '/vueeditor',
                //     component: resolve => require(['../components/page/VueEditor.vue'], resolve)    // Vue-Quill-Editor组件
                // },
                // {
                //     path: '/markdown',
                //     component: resolve => require(['../components/page/Markdown.vue'], resolve)     // Vue-Quill-Editor组件
                // },
                // {
                //     path: '/upload',
                //     component: resolve => require(['../components/page/Upload.vue'], resolve)       // Vue-Core-Image-Upload组件
                // },
                // {
                //     path: '/basecharts',
                //     component: resolve => require(['../components/page/BaseCharts.vue'], resolve)   // vue-echarts-v3组件
                // },
                // {
                //     path: '/mixcharts',
                //     component: resolve => require(['../components/page/MixCharts.vue'], resolve)    // vue-echarts-v3组件
                // },
                {
                    path: '/info',
                    component: resolve => require(['../components/page/Info.vue'], resolve)    // vue-echarts-v3组件
                },
                {
                    path: '/manager',
                    component: resolve => require(['../components/page/Manager.vue'], resolve)    // vue-echarts-v3组件
                },
                {
                    path: '/user',
                    component: resolve => require(['../components/page/User.vue'], resolve)    // vue-echarts-v3组件
                },
                {
                    path: '/slider',
                    component: resolve => require(['../components/page/Slider.vue'], resolve)    // vue-echarts-v3组件
                },
                {
                    path: '/classify',
                    component: resolve => require(['../components/page/Classify.vue'], resolve)    // vue-echarts-v3组件
                },
                {
                    path: '/sale',
                    component: resolve => require(['../components/page/Sale.vue'], resolve)    // vue-echarts-v3组件
                },
                {
                    path: '/show',
                    component: resolve => require(['../components/page/Show.vue'], resolve)    // vue-echarts-v3组件
                },
                {
                    path: '/order',
                    component: resolve => require(['../components/page/Order.vue'], resolve)    // vue-echarts-v3组件
                },
                {
                    path: '/goods',
                    component: resolve => require(['../components/page/Goods.vue'], resolve)    // vue-echarts-v3组件
                },
                {
                    path: '/handleGoods',
                    component: resolve => require(['../components/page/HandleGoods.vue'], resolve)    // vue-echarts-v3组件
                }
            ]
        },
        {
            path: '/login',
            component: resolve => require(['../components/page/Login.vue'], resolve)
        },
    ]
})
