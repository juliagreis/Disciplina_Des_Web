const botoes = document.querySelectorAll(".botao_comprar");
const carrinho = document.querySelector("#carrinho");
const quantidade = document.querySelector("#quantidade");
const verCarrinho = document.querySelector("#verCarrinho");
const itensCarrinho = document.querySelector("#itensCarrinho");
const busca = document.querySelector("#busca");

let carrinhoItens = {};

botoes.forEach(function(botao) {

    botao.addEventListener("mouseover", function() {
        botao.querySelector(".msg_comprar").textContent = "Adicione no carrinho";
        botao.classList.add("botao_destacado");
    });

    botao.addEventListener("mouseout", function() {
        botao.querySelector(".msg_comprar").textContent = "Comprar";
        botao.classList.remove("botao_destacado");
    });

    botao.addEventListener("click", function() {

        const produto = botao.parentElement.querySelector("h3").textContent;

        if (carrinhoItens[produto]) {
            carrinhoItens[produto]++;
        } else {
            carrinhoItens[produto] = 1;
        }

        atualizarCarrinho();
        carrinho.classList.add("cheio");
    });
});

verCarrinho.addEventListener("click", function() {
    carrinho.classList.toggle("aberto");
});

function atualizarCarrinho() {

    itensCarrinho.innerHTML = "";

    let total = 0;

    for (let produto in carrinhoItens) {

        const item = document.createElement("li");

        item.textContent =
            produto + " - quantidade: " + carrinhoItens[produto];

        itensCarrinho.append(item);

        total += carrinhoItens[produto];
    }

    quantidade.textContent = total;
}

busca.addEventListener("input", function() {
    const texto = busca.value.toLowerCase();
    botoes.forEach(function(botao) {

        const produto = botao.parentElement;
        const nome = produto.querySelector("h3").textContent.toLowerCase();

        if (nome.includes(texto)) {
            produto.style.display = "";
        } else {
            produto.style.display = "none";
        }
    });
});

