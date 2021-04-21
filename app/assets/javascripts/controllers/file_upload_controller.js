setTimeout( function() { 
    console.log(window.application)
    application.register("file-upload", class extends Stimulus.Controller {
      static get targets() { return [ "input", "file", "url", 'spinner', 'preview' ]}
             
      submit(e) {

          e.preventDefault()
      }

      change(e) {
        let lement = document.createElement("form");
        lement.appendChild(e.target.cloneNode(true))

        let self = this

        self.spinnerTarget.classList.remove("hidden")
        Rails.ajax({
            url: "/admin/foods/upload_image",
            type: "post",
            data: new FormData(lement),
            enctype: 'multipart/form-data',
            success: function(data) {
              self.urlTarget.value = data.url
              self.previewTarget.setAttribute('src', data.url)
              self.spinnerTarget.classList.add("hidden")
            },
            error: function(data) {
                self.spinnerTarget.classList.add("hidden")
            }
          })
      }

      hide() { 
        this.listOfFoodsTarget.classList.add("hidden")
      }
  
    })
  }, 500)  
  