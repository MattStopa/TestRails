setTimeout( function() {
  console.log(window.application)
  application.register("fact-adder", class extends Stimulus.Controller {
    static get targets() { return [ "newTags", "existingTags", "popup", "toggleButton", "finalValue" ]}

    saveDataToHidden() {
      let ids = []
      for(let tr of this.existingTagsTarget.querySelectorAll("tr")) {
        ids.push(tr.getAttribute("data-id"))
      }

      this.finalValueTarget.value = ids.join(",")
    }

    add(e) {
      console.log(e.target.parentElement.parentElement)
      e.target.setAttribute("data-action","click->fact-adder#remove")
      e.target.innerHTML = "Remove" // Toggle Button
      this.existingTagsTarget.append(e.target.parentElement.parentElement)
      this.popupTarget.classList.add('hidden')
      this.toggleButtonTarget.innerHTML ="Add Fact"
      this.saveDataToHidden()
    }

    remove(e) {
      console.log(e.target.parentElement.parentElement)
      e.target.setAttribute("data-action","click->fact-adder#add")
      e.target.innerHTML = "Add"
      this.newTagsTarget.append(e.target.parentElement.parentElement)
      this.saveDataToHidden()
    }

    showAddFact(e) {
      this.popupTarget.classList.toggle('hidden')
      e.target.innerHTML = e.target.innerHTML === "Remove Fact" ? "Add Fact" : "Remove Fact"
    }

  })
}, 500)
