namespace :dev do
  desc "Configura Ambiente de Desenvolvimento"
  task setup: :environment do
    if Rails.env.development?

        show_spinner("Apagando BD...") {%x(rails db:drop)} #do / end de somente uma linha = {}

        show_spinner("Criando DB") {%x(rails db:create)}

        show_spinner("Migrando as Tabelas") {%x(rails db:migrate)}

        %x(rails dev:add_coins)
        
        %x(rails dev:add_mining_types)

    else
      puts "Você não está em modo de desenvolvimento"
    end
end

  desc "Cadastra Moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando Moedas no BD...") do 
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
    end
end


desc "Cadastra os Tipos de Mineração" #Descrição da task
task add_mining_types: :environment do #name of task and its mode to run
  show_spinner("Cadastrando Tipos de Mineração no BD...") do 
    mining_types = [
      {description: "Proof of Work", acronym: "PoW"},
      {description: "Proof of Stake", acronym: "PoS"},
      {description: "Proof of Capacity", acronym: "PoC"}
    ]
    mining_types.each do |mining_type|        
      MiningType.find_or_create_by!(mining_type)
   end
  end
end
 

  def show_spinner(msg_start, msg_end = "Concluído")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
