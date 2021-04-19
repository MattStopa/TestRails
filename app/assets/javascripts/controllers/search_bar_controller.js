setTimeout( function() { 
  

    console.log(window.application)
    application.register("search-bar", class extends Stimulus.Controller {
      static get targets() { return [ "listOfFoods", "input" ]}
                         
      change(e) {
        this.listOfFoodsTarget.classList.remove("hidden")
        if(this.inputTarget.value.length == 0) return

        let self=  this;
        Rails.ajax({
            url: "/search/" + this.inputTarget.value,
            type: "get",
            data: "",
            success: function(data) {
              self.listOfFoodsTarget.innerHTML = ""
              for(let child of data.children[0].children[1].children) { 
                  self.listOfFoodsTarget.append(child)
              }

            },
            error: function(data) {}
          })

      }

      hide() { 
        this.listOfFoodsTarget.classList.add("hidden")
      }
  
    })
  }, 500)  
  