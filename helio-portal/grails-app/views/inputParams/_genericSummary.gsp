<%-- Template for the param set summary
Expected params:
 * Integer step: step number for help text.
 * String paramName : name of the param
 * String title
 --%><tr>
  <td style="border-top: solid 1px gray;">
    <b><g:message code="input.summary.${paramName}.title" /></b>
    <table style="margin-bottom: 10px;">
      <tr>
        <td valign="top">
          <div class="paramDroppable <g:if test="${paramDroppableName}">paramDroppableParamSet_${paramDroppableName}</g:if> paramDroppable${paramName}" style="width: 70px; height: 70px; padding: 0; float: left; margin: 10px;">
            <img id="img${paramName}Summary" class="paramDraggable paramDraggable${paramName}"  style="margin:11px" src="${resource(dir:'images/helio',file:'circle_' + paramName + '_grey.png')}" />
          </div>
          <div class="contextMenu show${paramName}<g:if test="${paramDroppableName}">_${paramDroppableName}</g:if>_ContextDialog" data-type="${paramName}<g:if test="${paramDroppableName}">_${paramDroppableName}</g:if>">
          		<ul style="line-height:200%">
					<li class="show${paramName}Dialog">Select new ${paramName}</li>
					<li class="addToDataCard">Add ${paramName } to data cart</li>
				</ul>
				<p>Select ${paramName} from data cart</p>
				<ul class="itemList">
					
				</ul>
          </div>
        </td>
        <td rowspan="2" id="text${paramName}Summary" class="candybox summaryBox showDialog show${paramName}Dialog" >
        </td>
        <td rowspan="2">
           <div class="button${paramName} clear${paramName}Summary">Clear</div>
        </td>
      </tr>
	</table>
  </td>
  <td style="border-top: solid 1px gray; vertical-align: top;">
    <div class="message"><b>Step ${step}</b><br/><g:message code="input.summary.${paramName}.helptext" /></div>
  </td>
</tr>