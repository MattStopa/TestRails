setTimeout( function() { 
  

  console.log(window.application)
  application.register("hello", class extends Stimulus.Controller {
    static get targets() { return [ "publicationYear", "stupid" ]}
                       
    greet(e) {
      let info = e.target.getAttribute('data-info')
      // this.stupidTarget.innerHTML = "ljkasdfkjlfs"
      this.publicationYearTarget.value = info
    }

    get name() {
      return this.nameTarget.value
    }
  })
}, 500)  
