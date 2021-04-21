setTimeout( function() { 
  

    console.log(window.application)
    application.register("search-bar", class extends Stimulus.Controller {
      static get targets() { return [ "listOfFoods", "input" ]}
                 
      initialize() {
      }

      change(e) {

        this.listOfFoodsTarget.classList.remove("no-show")

        // for(let food of this.listOfFoodsTarget.querySelectorAll('.image-link')) { 
        //   food.setAttribute('src', food.getAttribute('data-src'))
        // }

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
           self.listOfFoodsTarget.classList.add("no-show")
        }, 100)

      }
  
    })
  }, 500)  
  