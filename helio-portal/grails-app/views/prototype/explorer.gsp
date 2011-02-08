<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->
<%@ page import="ch.i4ds.helio.frontend.model.*" %>
<%@ page import="ch.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Heliophysics Integrated Observatory</title>

    <!--link rel="stylesheet" href="${ resource(dir:'css/humanity',file:'jquery-ui-1.8.5.custom.css')}" /-->
    <link rel="stylesheet" href="${ resource(dir:'css',file:'jquery-ui-1.8.2.custom.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'navbar.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'anytime.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'prototype.css')}" />
    
   
      <link rel="stylesheet" href="${resource(dir:'css',file:'demo_table.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'demo_page.css')}" />
    
  <g:javascript library="jquery" plugin="jquery"/>
  <g:javascript src="jquery-ui-1.8.5.custom.min.js"/>
  <g:javascript src="jquery.tools.min.js"/>
  <g:javascript src="helio-prototype.js"/>
  <g:javascript src="/helio/Shelf.js"/>
  <g:javascript src="/helio/History.js"/>
  <g:javascript src="/helio/HelioElement.js"/>
  
  <g:javascript src="jquery.dataTables.js" />
 



  
  <link rel="shortcut icon" href="${resource(dir:'images/helio',file:'sun.ico')}" type="image/x-icon" />


</head>
<body>
  <div id="page-background">
    <img src="${resource(dir:'images/background',file:'bg_flat.jpg')}"   style="width:100%;height:150px"  alt="background">
    <!--div style="width:100%;height:150px;background-color:orange"></div-->
  </div>
  <div id="logo">
    <img src="${resource(dir:'images/background',file:'helio_transp.png')}"  width="350px" height="120px" />
    <img id="line" src="${resource(dir:'images/background',file:'line_transp.png')}" height="120px"  />
  </div>
   <div >
      <!-- elements with tooltips -->
		<g:render template="navbar" />


    </div>
  <div id="container" >
  

<div id="testdiv" class="displayable" style="display:none">
        Selection
        <div style="margin-top:4px;margin-bottom:4px;cursor:pointer;padding:4px;background-color:black;color:white;border:1px solid #464693;" id="saveButton">Save Results</div>
      </div>
     
    <div id="content-container">

      

      <div style="display:block;" id="section-navigation">
        <ul>
          
          <li><div><img width="80px" src="${resource(dir:'images/icons/toolbar',file:'scroller_u.png')}" alt="Angry face" /></div></li>
          <li><div class="draggable"><img title="Query heliophysics event catalogues" src="${resource(dir:'images/icons/toolbar',file:'event.png')}" alt="HEC" /></div></li>
          <li><div class="draggable"><img title="Query capabilities of instruments" src="${resource(dir:'images/icons/toolbar',file:'ics.png')}" alt="ICS" /></div></li>
          <li><div class="draggable"><img title="Query instrument location" src="${resource(dir:'images/icons/toolbar',file:'ils.png')}" alt="ILS" /></div></li>
          <li><div class="draggable"><img title="Query for instrument data" src="${resource(dir:'images/icons/toolbar',file:'dpas.png')}" alt="DPAS" /></div></li>
          <li><div class="draggable"><img title="Filter" src="${resource(dir:'images/icons/toolbar',file:'upload_vot.png')}" alt="upload" /></div></li>
          <li><div class="draggable"><img title="User Space" src="${resource(dir:'images/icons/toolbar',file:'userspace.png')}" alt="userspace" /></div></li>
          
          
          

          <li><div><img width="80px" src="${resource(dir:'images/icons/toolbar',file:'scroller_d.png')}" alt="Angry face" /></div></li>


        </ul>
      </div>
      <div style="display:block;" id="history">
        <div><img style="float:left;display:inline;"height="60px" src="${resource(dir:'images/icons/toolbar',file:'scroller_l.png')}" alt="Angry face" /></div>
        <div style="float:left;display:inline;overflow:visible" id="history2"></div>
        
        <div><img style="float:right;display:inline;"height="60px" src="${resource(dir:'images/icons/toolbar',file:'scroller_r.png')}" alt="Angry face" /></div>
        <div><img style="float:right;display:inline;margin-top:15px"height="30px" id="clearButton" src="${resource(dir:'images/icons/toolbar',file:'delet40.png')}" alt="Angry face" /></div>
        
        
      </div><!--history-->

      <div style="display:block;" id="content">
        <div id="droppable-inner" class="ui-widget-header">
          
          
            <div id="displayableResult" class="displayable" style="display:none">
            
          </div>
          
          
            <img class="displayable" width="250px" height="200px" src="../images/icons/drophere2.png" alt="Smile">
            <h3 class="displayable" style="padding:15px;">Please double click a service on the left side menu. Alternatively you can drag and drop the icon from the left side into this panel.</h3>
            
       
          <div id="displayableDate" class="displayable" style="display:none">
            <g:render template="date" />
          </div>
          <div id="displayableTime" class="displayable" style="display:none">
            <g:render template="time" />
          </div>
          <div id="displayableCatalogue" class="displayable" style="display:none">
            <g:render template="catalogue" />
          </div>
          <div id="displayableICS" class="displayable" style="display:none">
            <g:render template="ics" />
          </div>
          <div id="displayableILS" class="displayable" style="display:none">
            <g:render template="ils" />
          </div>
          <div id="displayableDPAS" class="displayable" style="display:none">
            <g:render template="dpas" />
          </div>
          <div id="displayableFilter" class="displayable" style="display:none">
            <g:render template="filter" />
          </div>
          <div id="displayableUserspace" class="displayable" style="display:none">
            <g:render template="userspace" />
          </div>
           <div id="displayableOnLoading" class="displayable" style="width:100%;height:300px;background-color:white;z-index:2700;display:none">
             
             <center><h1>Your query is being processed.</h1></center>
          </div>


        </div><!--droppable-inner-->
      </div>

      <div id="responseDivision" style="width:858px;">

    



      </div>
    </div>
  </div>
<div id="temp">

</div>

</body>
</html>
