require 'selenium-webdriver'
opts = {
  url: 'http://chrome:4444/wd/hub'
  # url: 'http://localhost:4444/wd/hub'
}
driver = Selenium::WebDriver.for :chrome, opts

begin
  driver.get "https://tv.yahoo.co.jp/search/?q=#{ARGV[0]}"
  program_lists = driver.find_elements(:xpath, '//*[@id="main"]/div[7]/ul/li')
  program_lists.each do |row|
    date = row.find_element(:xpath, './/div[1]/p[1]/em').text
    time = row.find_element(:xpath, '//div[1]/p[2]/em').text
    title = row.find_element(:class, 'rightarea').find_element(:tag_name, 'a').text
    description = row.find_element(:class, 'rightarea').find_elements(:tag_name, 'p')[2].text
    puts "放送日時: #{date} #{time}"
    puts "タイトル: #{title}"
    puts "内容: #{description}"
    puts '--------------------'
  end
ensure
  driver.quit
end
