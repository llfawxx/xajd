<%@ page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/syscommon/head.ini"%>
	<script type="text/javascript" src="xsgzgl/xyfd/js/highcharts.js"></script>
	<script type="text/javascript" src="xsgzgl/xyfd/js/jquery.raty.js"></script>
	<link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script type="text/javascript">
		jQuery(function () {
            xscjfb();
            xfcjqs();
        })
		function grcjfxdc() {

        }
	</script>
</head>
<body style="width:100%">
<html:form action="/xyfd_xyyj" method="post" styleId="demoForm">
	<div style="text-align: center">
		<button onclick="grcjfxdc()">导出</button>
	</div>
	<div style='width:100%;overflow-x:hidden;overflow-y:auto;'>
		<table width="100%" border="0" class="formlist">
			<tbody>
			<tr>
				<td style="width: 10%;text-align: center">学生姓名</td>
				<td style="width: 15%;text-align: center">${xsxx.xm}</td>
				<td style="width: 10%;text-align: center">学号</td>
				<td style="width: 10%;text-align: center">${xsxx.xh}</td>
				<td style="width: 15%;text-align: center">专业</td>
				<td style="width: 15%;text-align: center">${xsxx.zymc}</td>
				<td style="width: 10%;text-align: center">班级</td>
				<td style="width: 15%;text-align: center">${xsxx.bjmc}</td>
			</tr>
			<tr>
				<td colspan="8" style="width: 80%;text-align: center">
					<div id="container" style="width: 550px; height: 400px; margin: 0 auto"></div>
				</td>
			</tr>
			<tr>
				<td colspan="8" style="width: 80%;text-align: center">
					<div id="container2" style="width: 550px; height: 400px; margin: 0 auto"></div>
				</td>
			</tr>
			</tbody>
		</table>
	</div>
</html:form>
<script type="text/javascript">
    function xscjfb() { //各学期成绩分布情况
        var chart = {
            type: 'column'
        };
        var title = {
            text: '各学期成绩分布情况'
        };
        var xAxis = {
            categories: ${xnxqList},
            crosshair: true
        };
        var yAxis = {
            min: 0,
            title: {
                text: ''
            }
        };
        var tooltip = {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y:.1f} 科</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        };
        var plotOptions = {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        };
        var credits = {
            enabled: false
        };
        var series= [
            {
                name: '不及格数',
                data: ${bjgxxList}
            },
            {
                name: '优良数',
                data: ${ylxxList}
            },
            {
                name: '总数',
                data: ${zsxxList}
            }

        ];
        var json = {};
        json.chart = chart;
        json.title = title;
        json.tooltip = tooltip;
        json.xAxis = xAxis;
        json.yAxis = yAxis;
        json.series = series;
        json.plotOptions = plotOptions;
        json.credits = credits;
        jQuery('#container').highcharts(json);
    }

    function xfcjqs() {//学分成绩趋势
        var title = {
            text: '学分成绩趋势'
        };
        var xAxis = {
            categories: ${xnxq2List}
        };
        var yAxis = {
            title: {
                text: ''
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        };
        var tooltip = {
            valueSuffix: ''
        }
        var legend = {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        };
        var series =  [
            {
                name: '',
                data: ${xfcjxxList}
            }
        ];
        var json = {};
        json.title = title;
        json.xAxis = xAxis;
        json.yAxis = yAxis;
        json.tooltip = tooltip;
        json.legend = legend;
        json.series = series;
        jQuery('#container2').highcharts(json);
    }
</script>
</body>
</html>

 