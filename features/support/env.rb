Before() do
  puts "Before hook. This will work before every test case!"
  @test_user = User.new('api_test_account@yopmail.com', 'Parole123')
end

After() do
  puts "This happens after a test!"
end