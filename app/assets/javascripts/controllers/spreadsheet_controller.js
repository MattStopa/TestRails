setTimeout( function() { 
  

    console.log(window.application)
    application.register("spreadsheet", class extends Stimulus.Controller {
      static get targets() { return [ "table", "input" ]}

      setActiveCell(dom) {
        console.log("ActiveCell", dom)
        this.activeCell = dom
      }
      

      addColumn(e) {
        for(let row of this.tableTarget.querySelectorAll("tr")) { 
          console.log(row)
          row.insertAdjacentHTML('beforeend', '<td><input type="text" value="" data-id="a-1" data-action="keyup->spreadsheet#change click->spreadsheet#clicked"></td>')
        }
      }

      addRow() {
        let length  = this.tableTarget.querySelectorAll("tr")[0].querySelectorAll("td").length
        
        let tds = []
        for(let i = 0; i < length; i++) {
          tds.push('<td><input type="text" value="" data-id="a-1" data-action="keyup->spreadsheet#change click->spreadsheet#clicked"></td>')
        }

        this.tableTarget.insertAdjacentHTML('beforeend', `
          <tr>
            ${tds.join("")}
            
          </tr>
        `)
      }

      clicked(c) {

        let cellID = c.target.getAttribute("data-id")
        if(this.activeCell && cellID !== this.activeCell.getAttribute("data-id")) {
          this.activeCell.value = this.activeCell.value + cellID
        }
      }
      

      change(e) { 
        if(e.target.value[0] === "=") {
          console.log("FOMULA")
          e.target.classList.add("formulaActive")
          this.setActiveCell(e.target)
        } else {
          e.target.classList.remove("formulaActive")
        }
      }
    })
  }, 500)  
  
  
{/* <div data-controller="spreadsheet" class="border mt-5">
    <div >
       <div class="button"  data-action="click->spreadsheet#addRow" >Add Row</div>
       <div class="button"  data-action="click->spreadsheet#addColumn" >Add Column</div>
        <table class ="" data-target="spreadsheet.table">
           <tr>
            <td><input type="text" value="hey" data-id="a-1" data-action="keyup->spreadsheet#change click->spreadsheet#clicked"></td>
            <td><input type="text" value="argh" data-id="a-2" data-action="keyup->spreadsheet#change click->spreadsheet#clicked" ></td>
           </tr>
           <tr>
            <td><input type="text" value="434"  data-id="b-1" data-action="keyup->spreadsheet#change click->spreadsheet#clicked"></td>
            <td><input type="text" value="232"  data-id="b-2" data-action="keyup->spreadsheet#change click->spreadsheet#clicked"></td>
           </tr>
        </table>
    </div>
</div> */}