class LoginPage
  include Capybara::DSL

  def go
    visit "/"
  end

  def with(email, password)
    find("input[name=email]").set email
    find("input[name=password]").set password
    click_button "Entrar"
  end

  def alert
    find(".alert").text
  end
end
