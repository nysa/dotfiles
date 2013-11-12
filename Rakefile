require 'rake'

DOTFILES_HOME = ENV['HOME']
DOTFILES_ROOT = File.dirname(__FILE__)
DOTFILES = Dir.glob('vim/*')

task :install do
  Rake::Task['submodules'].invoke
  Rake::Task['symlink'].invoke
  Rake::Task['vundle'].invoke
end

desc 'Initialize and update git submodules'
task :submodules do
  Dir.chdir(DOTFILES_ROOT)
  puts 'Installing submodules...'
  system 'git submodule update --init'
  puts 'Submodules installed!'
end

desc 'Symlink dotfiles'
task :symlink do
  Dir.chdir(DOTFILES_ROOT)
  puts 'Symlinking dotfiles...'

  DOTFILES.each do |f|
    file = f.split('/').last
    source = "#{ENV['PWD']}/#{f}"
    target = "#{ENV['HOME']}/.#{file}"
    system "ln -vsf #{source} #{target}"
  end

  puts 'Dotfiles symlinked!'
end

desc 'Install Vundle bundles'
task :vundle do
  puts 'Installing Vundle bundles...'
  system 'vim +BundleInstall +qall'
  puts 'Vundle bundles installed!'
end

task :default => 'install'

