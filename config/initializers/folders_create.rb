require 'fileutils'

ckeditor_folder = File.path(Rails.root.join('public', 'ckeditor_assets'))
system_folder = File.path(Rails.root.join('public', 'system'))
uploads_folder = File.path(Rails.root.join('public', 'uploads', 'exports'))

unless File.directory?(ckeditor_folder)
  FileUtils.mkdir(ckeditor_folder)
end

unless File.directory?(system_folder)
  FileUtils.mkdir(system_folder)
end

unless File.directory?(uploads_folder)
  FileUtils.mkdir(uploads_folder)
end