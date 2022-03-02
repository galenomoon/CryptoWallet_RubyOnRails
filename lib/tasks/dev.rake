namespace :dev do
  desc "Configura Ambiente de Desenvolvimento"
  task setup: :environment do
    if Rails.env.development?

        show_spinner("Apagando BD...") {%x(rails db:drop)} #do / end de somente uma linha = {}

        show_spinner("Criando DB") {%x(rails db:create)}

        show_spinner("Migrando as Tabelas") {%x(rails db:migrate)}

        show_spinner("Alimentando BD") {%x(rails db:seed)}

    else
      puts "Você não está em modo de desenvolvimento"
    end
end
  def show_spinner(msg_start, msg_end = "Concluído")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
