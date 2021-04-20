setTimeout( function() { 
  

    console.log(window.application)
    application.register("search-bar", class extends Stimulus.Controller {
      static get targets() { return [ "listOfFoods", "input" ]}
                         
      change(e) {
        console.log("GOT HERE")
        this.listOfFoodsTarget.classList.remove("hidden")
        if(this.inputTarget.value.length == 0) return

        let self=  this;
        Rails.ajax({
            url: "/search/" + this.inputTarget.value,
            type: "get",
            data: "",
            success: function(data) {
              self.listOfFoodsTarget.innerHTML = ""
              self.listOfFoodsTarget.append(data.children[0].children[1].children[0])
            },
            error: function(data) {}
          })

      }

      hide() {
        let self = this
        setTimeout( function() {
          self.listOfFoodsTarget.classList.add("hidden")
        }, 100)

      }
  
    })
  }, 500)  
  