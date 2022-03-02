# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
spinner = TTY::Spinner.new("[:spinner] Cadastrando Moedas")
spinner.auto_spin
coins=[
    {
        description: "Bitcoin",
        acronym: "BTC",
            url_image: "https://i.pinimg.com/originals/d2/7e/8e/d27e8e720a42c6ef1210cca03a354034.jpg"
        },

        {
            description: "Ethereum",
            acronym: "ETH",
            url_image: "https://d33wubrfki0l68.cloudfront.net/fcd4ecd90386aeb50a235ddc4f0063cfbb8a7b66/4295e/static/bfc04ac72981166c740b189463e1f74c/40129/eth-diamond-black-white.jpg"
        },  

        {
            description: "Dash",
            acronym: "DSH",
            url_image: "https://icons.iconarchive.com/icons/cjdowner/cryptocurrency-flat/512/Dash-icon.png"
        }    
    ]

coins.each do |coin|        
    Coin.find_or_create_by!(coin)
end
spinner.success("[Concluído]")