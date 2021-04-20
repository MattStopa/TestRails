setTimeout( function() { 
  

  console.log(window.application)
  application.register("tag-picker", class extends Stimulus.Controller {
    static get targets() { return [ "finalValue", "dropdown", "existingTags" ]}

    saveCurrentState() {
      let newArray = []
      for(let child of this.existingTagsTarget.children) {
        newArray.push(child.getAttribute('data-info'))
      }

      this.finalValueTarget.value = newArray
    }

    addItem(e) {
      let info = e.target.getAttribute('data-info')
      // this.stupidTarget.innerHTML = "ljkasdfkjlfs"

      var cln = e.target.cloneNode(true);
      cln.setAttribute("data-action", "click->tag-picker#removeItem")
      e.target.classList.toggle('hidden')
      this.existingTagsTarget.append(cln)
      let newArray = []
      this.saveCurrentState()
    }

    removeItem(e) { 
      let lookupStr = "[data-info='" + e.target.getAttribute('data-info')  + "']"
      let items = document.querySelectorAll(lookupStr)
      for(let i of items) { 
        i.classList.remove('hidden')
      }
      console.log(items)
      e.target.remove()
      this.saveCurrentState()

    }

    show(e) {
      setTimeout( () => {
        this.dropdownTarget.classList.toggle('hidden')
      }, 100)
    }

    keyup(e) {

      let items = this.dropdownTarget.querySelectorAll("div")
      for(let item of items) {

        if(e.target.value.length===0) {
          item.classList.remove('hidden')
        }
        else if(item.getAttribute('data-value').search(new RegExp(e.target.value, "i")) < 0) {
          item.classList.add('hidden')
        }
      }
    }

    get name() {
      return this.nameTarget.value
    }

  })
}, 500)  
