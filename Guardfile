# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'bundler' do
  watch('Gemfile')
end

guard 'passenger', ping: true do
  watch('lib/.*\.rb')
  watch('config/.*\.rb')
end

guard 'livereload' do
  watch(%r{app/.+\.(erb|haml)})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{(public/|app/assets).+\.(css|js|html)})
  watch(%r{(app/assets/.+\.css)\.s[ac]ss}) { |m| m[1] }
  watch(%r{(app/assets/.+\.js)\.coffee}) { |m| m[1] }
  watch(%r{config/locales/.+\.yml})
end

guard 'annotate', position: 'after', routes: true, run_at_start: false do
  watch( 'db/schema.rb' )

  # Uncomment the following line if you are running routes annotation
  # with the ":routes => true" option
  watch( 'config/routes.rb' )
end

