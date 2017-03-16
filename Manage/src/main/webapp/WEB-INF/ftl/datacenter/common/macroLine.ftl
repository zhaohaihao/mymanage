<#macro dcLine divId title legend Xaxis Yaxis interval='auto' format='{value}' divHeight=400>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="${divId}" style="height:${divHeight}px"></div>
	<script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
    <script type="text/javascript">
        // 路径配置
        require.config({
            paths: {
                echarts: 'http://echarts.baidu.com/build/dist'
            }
        });
        
        // 使用
        require(
            [
                'echarts',
                'echarts/chart/line'
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('${divId}')); 
                var option = {
                	title : {
				        text: '${title}'
				    },
				    tooltip : {
				        trigger: 'axis'
				    },
				    legend: {
				    	y:'bottom',
				        data:[${legend}]
				    },
				    toolbox: {
				        feature : {
				            mark : {show: true},
				            dataView : {show: true, readOnly: false},
				            magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
				            restore : {show: true},
				            saveAsImage : {show: true}
				        }
				    },
				    calculable : true,
				    xAxis : [
				        {
				            type : 'category',
				            boundaryGap : false,
				            data : [${Xaxis}],
				            axisLabel:{interval:'${interval}',}
				        }
				    ],
				    yAxis : [
				        {
				            type : 'value',
				            splitArea: {show: true},
				            axisLabel : {
                                formatter: '${format}'
                            }
				        }
				    ],
				    series : [
				        <#nested/>
				    ]
				};
                // 为echarts对象加载数据 
                myChart.setOption(option); 
            }
        );
    </script>
</#macro>