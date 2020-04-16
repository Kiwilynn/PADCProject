
  $(document).ready( () =>{

    // dummy data over items - C0 story - 15-05-2020
    let items = [
        { id: "1", NAME: "Black Coffee", PRICE: 20},
        { id: "2", NAME: "Cappuccino", PRICE: 25},
        { id: "3", NAME: "Kaffe Latte", PRICE: 30},
        { id: "4", NAME: "Hot Chocolate", PRICE: 38},
        { id: "5", NAME: "Filter Kaffe", PRICE: 10},
      ];
    
  
    $.each(items, function () {
        
        $(`<div id = item-box>
            Id:          ${this.id}<br>
            Name:        ${this.NAME}<br>
            Price:       ${this.PRICE}<br><br>`
        ).appendTo("#item-box");        
    });


    //USER STORY C1 - 15-05-2020
    $("#form").click(function(){

      let item = {
        name,
        price
      } 

      name = $("#name").val
      PRICE = $("#price").val

      items.push($("#form").push(item));
      items.appendTo
      console.log(item)
    });
    


    $('#addItem-button').on('click',function () {
      var newItem = {
          name : $name.val(),
          price : $price.val(),
      };
      items.appendTo(newItem)
      
  })

});



