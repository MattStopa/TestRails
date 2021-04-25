setTimeout( function() { 
    console.log(window.application)
    application.register("warning", class extends Stimulus.Controller {
      static get targets() { return ['box']}
             
      initialize() { 
        let medNotice = localStorage.getItem("medicalNotice")

        if (medNotice) {
          this.hide()
        }
      }

      hide() { 
        this.boxTarget.classList.add("hidden")
      }
    

      agree() {
        localStorage.setItem("medicalNotice", JSON.stringify({date: new Date()}))
        this.hide()
      }
  
    })
  }, 500)  
  