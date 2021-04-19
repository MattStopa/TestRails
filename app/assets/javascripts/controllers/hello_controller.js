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
      console.log(this.dropdownTarget.classList.toggle('hidden'))
    }

    get name() {
      return this.nameTarget.value
    }
  })
}, 500)  
