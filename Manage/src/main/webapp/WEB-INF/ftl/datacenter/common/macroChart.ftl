<#macro dcChart divId title legend divHeight=400 divWidth=100>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="${divId}" class="${divId}" style="height:${divHeight}px;width:${divWidth}%;"></div>
    <script type="text/javascript">
        // charts路径配置
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

				    <#nested/>
				};
                // 为echarts对象加载数据 
                myChart.setOption(option); 
            }
        );
    </script>
</#macro>