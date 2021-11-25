function myFunction()
{   // get the elements in the input field
    var tickets = document.getElementById( "ticket_amount" );


     // turn into integers
     var value1 = parseInt( tickets.value );

    //get result
    var result = document.getElementById( "result" );


    // calculations
    var total = value1 * 100;
    var tax = total * 0.09;
    var taxx = tax.toFixed(2);
    var total2 = total+ tax;

    if ( value1 >= 1 )
    {
        result.innerHTML = "<h4>Your total + tax for " + value1 + " ticket is $" + total2 + " and the estimated tax will be: $" + taxx + "</h4>";
    } // end if
} // end myFunction

function start()
{
    var Button = document.getElementById( "theButton" );
    Button.addEventListener( "click", myFunction, false );
}

window.addEventListener("load", start, false);
