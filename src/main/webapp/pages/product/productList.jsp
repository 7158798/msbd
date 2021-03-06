<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored ="false" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/plugin/extjs/resources/css/ext-all.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/btnCss.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/tableNoraml.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugin/extjs/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugin/extjs/ext-all.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/yxdWin.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/popWindow.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugin/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/product/product.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/common.js"></script>

<title>产品列表</title>
<script type="text/javascript">
//初始化复选框
$(document).ready( function (){
	createLoadPromptMaskLayer('body','maskLayer','maskLayerPrompt','数据正在查询中，请稍后...','font_yh16');
	var selectid="${mapP['selectId']}";
	$("input[name=check]").each(function(){
		var sid = $(this).val().trim();
		if(selectid.indexOf(sid)!= -1){
			$(this).attr("checked",true);
		}
	});
});
var contextPath = "${pageContext.request.contextPath}";
</script>
</head>
<body>
	<div class="frameBody">
	<div class="frameTitle">我是用户产品列表 (っ´Ι`)っ</div>
	<fieldset style="padding:1 5px 0 5px;margin-bottom:5px;font-weight:100;weight:100%;margin-top:10px">
	<legend><span style="font-size:14px"> </span></legend>
		<table>
			<tr>
				<td>产品名称：</td>
				<%-- ${mapP['productName']} 获取map的值 --%>
				<td><input id="productName" name="productName" value="${mapP['productName']}"/></td>
				<td>产品类型：</td>
				<td><input id="productType" name="productType" value="${name}"/></td>
				<td>入库时间：</td>
				<td><input type="text" onFocus="var checkOutDate=$dp.$('checkOutDate');WdatePicker({onpicked:function(){receiveType.focus();queryDay();},dateFmt:'yyyy-MM-dd HH:mm',minDate:'%y-%M-{%d}'})" class="Wdate" size="10" maxlength="20" value="${ checkInDateVo }" id="checkInDate" name="checkInDate" readonly="readonly"></td>
				<td>出库时间</td>
				<td><input type="text" onFocus="WdatePicker({onpicked:function(){receiveType.focus();queryDay();},dateFmt:'yyyy-MM-dd HH:mm',minDate:'#F{$dp.$D(\'checkInDate\')}'})" class="Wdate" size="10" maxlength="20" value="${ checkOutDateVo }" id="checkOutDate" name="checkOutDate" readonly="readonly"></td>
				<td>操作人：</td>
				<td><input id="operator" name="operator" value=""/></td>
			</tr>
			<tr>
				<td>
				<input type="submit" id="btnSearch" name="btnSearch" onclick="productListQuery()" value="开始查询" class="btn_query" />
				</td>
				<td>
				<input type="button" id="exportProduct" name="exportProduct" value="导出" class="btn_query" onclick="exportProduct()" />
				<input type="button" id="btnClear" name="btnClear" value="重置" class="btn_cancel" onclick="changeClear()" />
				</td>
			</tr>
		</table>
	</fieldset>
	<br>
	<table width="100%" border="1" cellspacing="1" cellpadding="2" class="tableNormal">
		<thead>
			<tr>
				<th width="3%" style="text-align: center;">
					<input type="checkbox" id="allCheck" name="allCheck" onclick="selectAll()" />
				</th> 
				<th>序号</th>
				<th>产品名称</th>
				<th>产品类型</th>
				<th>入库时间</th>
				<th>操作人</th>
				<th>备注</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.list}" var="p" varStatus="vs">
					<tr>
						<td width="3%" style="text-align: center;">
							<input type="checkbox" id="check" name="check" onclick="setSelectAll()" value="${p.id}"/></td>
						<td>${vs.index+1}</td>
						<td style="text-align: left;">${p.bankid}</td>
						<td style="text-align: left;">${p.id}</td>
						<td style="text-align: left;">${p.psamid}</td>
						<td style="text-align: left;">${p.merchantCnName}</td>
						<td style="text-align: left;">${p.merchantPhone}</td>
					</tr>
			</c:forEach>
		</tbody>
	</table>
	<div style="width: 100%;" class="framePage" >${pages}</div>
	<table width="100%" border="0" cellspacing="1" cellpadding="3"class="tableNormal">
		<tr>
			<td style="text-align: left;">
				<input type="button" name="btnAdd" id="btnAdd" class="btn_create" onclick="addOrUpdatePage()" value="新增" />
				<input type="button" name="btnUpdate" id="btnUpdate" class="btn_create"  onclick="" value="修改" />
				<input type="button" name="btnDel" id="btnDel" class="btn_delete" onclick="" value="删除" />
				<input type="button" name="btnLog" id="btnLog" class="btn_act" onclick="" value="日志" />
			</td>
		</tr>
	</table>
	</div>
</body>
</html>