<template>
    <div>
        <div class="crumbs">
            <el-breadcrumb separator="/">
                <el-breadcrumb-item><i class="el-icon-date"></i> 图表</el-breadcrumb-item>
                <el-breadcrumb-item>数据分析</el-breadcrumb-item>
            </el-breadcrumb>
        </div>
        <div class="echarts">
            <IEcharts :option="pie_radius" ></IEcharts>
        </div>

        <div class="echarts">
            <IEcharts :option="pie" ></IEcharts>
        </div>
        
        <div class="echarts">
            <IEcharts :option="bar" ></IEcharts>
        </div>
    </div>
</template>

<script>
    import service from '../../assets/service.js'
    import qs from 'qs';
    import IEcharts from 'vue-echarts-v3';

    export default {
        components: {
            IEcharts
        },
        data: () => ({
            bar: {
                color:["#20a0ff","#13CE66","#F7BA2A","#FF4949"],
                title: {
                    text: '一周内注册'
                },
                xAxis: {
                    data: ["本周注册",""]
                },
                yAxis:{},
                series: [
                    {
                        name: "销量",
                        type: "bar",
                        data :[]
                    }
                ]
            },
            pie: {
                color:["#20a0ff","#13CE66","#F7BA2A","#FF4949","#61a0a8"],
                title : {
                    text: '支付方式',
                    x:'center'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    data: ["支付宝","微信"]
                },
                series : [
                    {
                        name: '销量',
                        type: 'pie',
                        radius : '55%',
                        center: ['50%', '50%'],
                        data:[
                            {value:'', name:'支付宝'},
                            {value:'', name:'微信'}
                        ],
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            },
            pie_radius:{
                color:["#20a0ff","#13CE66","#F7BA2A","#FF4949","#61a0a8"],
                title : {
                    text: '发货状态',
                    x:'center'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    // data: ["衬衫", "羊毛衫", "雪纺衫", "裤子", "高跟鞋"]
                    data: ["待发货", "已发货"]
                },
                series : [
                    {
                        name: '销量',
                        type: 'pie',
                        radius : ['40%','60%'],
                        data:[
                            {value:'', name:'待发货'},
                            {value:'', name:'已发货'}
                        ],
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            }
        }),
        created(){
            this.getPayData();
            this.getOrderData();
            this.getRegisterData();
        },
        methods:{
            // 获取支付数据
            getPayData(){
                let self = this;
                
                this.$axios.post(service.url('countPayType'),{headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                }).then((res) => {
                    if (res.data.code == 200) {     
                        self.pie.series[0].data[0].value=res.data.data.zhifubao;
                        self.pie.series[0].data[1].value=res.data.data.weixin;
                    }
                })
            },
            getOrderData(){
                let self = this;
                
                this.$axios.post(service.url('countOrderStatu'),{headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                }).then((res) => {
                    if (res.data.code == 200) {     
                        self.pie_radius.series[0].data[0].value=res.data.data.weitSend;
                        self.pie_radius.series[0].data[1].value=res.data.data.hadSend;
                    }
                })
            },
            getRegisterData(){
                let self = this;
                
                this.$axios.post(service.url('countRegister'),{headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                }).then((res) => {
                    if (res.data.code == 200) {     
                        self.bar.series[0].data.push(res.data.data);
                        // self.bar.series[0].data=res.data.data.hadSend;
                    }
                })
            }
        }
    }
</script>

<style scoped>
    .echarts {
        float: left;
        width: 500px;
        height: 400px;
    }
</style>