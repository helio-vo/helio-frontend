<div id="addItemDataCartDialog">
      		<p>There is already a cart item with the name <label for="itemName"></label> in your data cart!</p>
      		<p>What would you like to do next?</p>
      		
      		<div id="accordion">
				<h3>Rename the new item.</h3>
				<div>
					<table>
						<tr>
							<td>Name:</td>
							<td><input name="dataItemName" type="text" value=""/></td>
							
						</tr>
					</table>
					<button class="renameItem button ui-corner-all float-right">Ok</button>
				</div>
				<h3>Overwrite item from the data cart.</h3>
				<div>
					<p>Click on the item to overwrite.</p>
					<div class="sameNameItemList"></div>
					<div class="itemHoverInfo"><br></div>
				</div>
				<h3>Create a new item with the same name</h3>
				<div>
					<button class="createItem button ui-corner-all float-right">Ok</button>
				</div>
			</div>
<div>