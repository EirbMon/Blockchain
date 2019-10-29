$(document).ready(function () {
    var loader = $("#loader");
    var content = $("#content");
    console.log(window.web3.currentProvider.selectedAddress)
    loader.show();
    content.hide();
    $.get(`/getMyEirbmon?address=${window.web3.currentProvider.selectedAddress}`, function (response) {
        
        var pokemonsResults = $("#pokemonsResults");
        for (var i = 0; i < response.length; i++) {
            var id = response[i][0];
            var name = response[i][1];
            var level = response[i][2];
            var pokemonTemplate = "<tr><th>" + id + "</th><td>" + name + "</td><td>" + level + "</td></tr>"
            pokemonsResults.append(pokemonTemplate);

        }
        loader.hide();
        content.show();
    })
})


