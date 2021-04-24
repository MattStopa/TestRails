setTimeout( function() { 
  

    console.log(window.application)
    application.register("search-bar", class extends Stimulus.Controller {
      static get targets() { return [ "listOfFoods", "input", "foodsList", "tagsList" ]}
                 
      initialize() {
      }

      handleSearchItems(e, target) {
        if(this.inputTarget.value.length == 0) {
          for(let food of target.querySelectorAll('a')) { 
            food.classList.remove('hidden')
          }
          return
        }

        console.log(target.querySelectorAll('a'))

        for(let food of target.querySelectorAll('a')) { 
          let result = food.getAttribute('data-value').search(new RegExp(e.target.value, "i"))
          result === -1 ? food.classList.add("hidden") : food.classList.remove('hidden')
        }
      }

      change(e) {
        
        this.listOfFoodsTarget.classList.remove("no-show")

        this.handleSearchItems(e, this.foodsListTarget)
        this.handleSearchItems(e, this.tagsListTarget)



      }

      hide() {
        let self = this
        setTimeout( function() {
           self.listOfFoodsTarget.classList.add("no-show")
        }, 100)

      }
  
    })
  }, 500)  
  