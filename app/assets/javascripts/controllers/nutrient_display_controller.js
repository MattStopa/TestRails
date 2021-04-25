setTimeout( function() { 
    console.log(window.application)
    application.register("nutrient-display", class extends Stimulus.Controller {
      static get targets() { return []}
             
      copy(e) {
        const el = document.createElement('textarea');
        el.value = e.target.getAttribute("data-url");
        document.body.appendChild(el);
        el.select();
        document.execCommand('copy');
        document.body.removeChild(el);
      }
    })
  }, 500)  
  