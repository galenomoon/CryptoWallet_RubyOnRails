namespace :dev do
  desc "Configura Ambiente de Desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
        spinner = TTY::Spinner.new("[:spinner] Apagando BD")
        spinner.auto_spin
        %x(rails db:drop)
        spinner.success("(Concluído)")

        spinner = TTY::Spinner.new("[:spinner] Criando DB")
        spinner.auto_spin
        %x(rails db:create)
        spinner.success("(Concluído)")

        spinner = TTY::Spinner.new("[:spinner] Migrando as Tabelas")
        spinner.auto_spin
        %x(rails db:migrate)
        spinner.success("(Concluído)")

        spinner = TTY::Spinner.new("[:spinner] Alimentando BD")
        spinner.auto_spin
        %x(rails db:seed)
        spinner.success("(Concluído)")
    else
      puts "Você não está em modo de desenvolvimento"
  end
end
end
