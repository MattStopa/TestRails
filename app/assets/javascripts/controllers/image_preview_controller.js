setTimeout( function() { 
    console.log(window.application)
    application.register("image-preview", class extends Stimulus.Controller {
      static get targets() { return [ "input", "image" ]}
                         
      change(e) {
        this.imageTarget.src = this.inputTarget.value
        this.imageTarget.classList.remove('hidden') 
      }

      hide() { 
        this.listOfFoodsTarget.classList.add("hidden")
      }
  
    })
  }, 500)  
  