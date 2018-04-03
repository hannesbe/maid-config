# My [maid](https://github.com/hannesbe/maid) rules config - h@nnes.be 
# 
# Run using:
#
#     maid clean -n
#
#
# For more help on Maid:
#
# * Run `maid help`
# * Read the README, tutorial, and documentation at https://github.com/benjaminoakes/maid#maid
# * Ask me a question over email (hello@benjaminoakes.com) or Twitter (@benjaminoakes)
# * Check out how others are using Maid in [the Maid wiki](https://github.com/hannesbe/maid/wiki)

Maid.rules do

  rule 'ISO disk images in Downloads' do
    dir('~/Downloads/*.iso').each do |path|
      if 30.day.since?(accessed_at(path))
        trash(path)
      end
    end
  end

#  rule 'Linux applications in Debian packages' do
#    trash(dir('~/Downloads/*.deb'))
#  end

  rule 'Copy Linux .desktop files to Settings' do
    dir('~/Desktop/*.desktop').each do |path|
      copy(path, '~/Nextcloud/Settings/Applications/Linux .desktop')
    end
  end

  rule 'Screenshots on desktop to Pictures' do
    dir('~/Desktop/Screenshot*').each do |path|
      if 2.day.since?(accessed_at(path))
        move(path, '~/Pictures/Screenshots')
      end
    end
  end

  rule 'Text files on desktop to Nextcloud/Notes' do
    dir('~/Desktop/*.txt').each do |path|
      if 2.day.since?(accessed_at(path))
        move(path, '~/Nextcloud/Notes')
      end
    end
  end
  
  rule 'Markdown files on desktop to Nextcloud/Notes' do
    dir('~/Desktop/*.md').each do |path|
      if 2.day.since?(accessed_at(path))
        move(path, '~/Nextcloud/Notes')
      end
    end
  end
  
  rule 'Markdown files in Documents to Nextcloud/Notes' do
    dir('~/Documents/*.md').each do |path|
        move(path, '~/Nextcloud/Notes')
    end
  end
  
  rule 'Screenshots in Pictures to Pictures/Screenshots' do
    dir('~/Pictures/Screenshot*').each do |path|
      if 2.day.since?(accessed_at(path))
        move(path, '~/Pictures/Screenshots')
      end
    end
  end

# Move .PDF files from Downloads to Nextcloud _IN
  rule 'PDF files in Downloads' do
    move(dir('~/Downloads/*.pdf'), '~/Nextcloud/_IN')
  end

# Move .PDF files from G-Drive to Nextcloud
  rule 'Move files in G-Drive to Nextcloud' do
    move(dir('~/G-Drive/_IN/connexeon.com/F&A/*'), '~/Nextcloud/_connexeon.com/F&A/_IN')
    move(dir('~/G-Drive/_IN/connexeon.com/*'), '~/Nextcloud/_connexeon.com/_IN')
    move(dir('~/G-Drive/_IN/Connexeon/Ops/*'), '~/Nextcloud/_Connexeon/Ops/_IN')
    move(dir('~/G-Drive/_IN/Connexeon/F&A/*'), '~/Nextcloud/_Connexeon/F&A/_IN')
    move(dir('~/G-Drive/_IN/Connexeon/*'), '~/Nextcloud/_Connexeon/_IN')
    move(dir('~/G-Drive/_IN/Finmo/F&A/*'), '~/Nextcloud/_Finmo/F&A/_IN')
    move(dir('~/G-Drive/_IN/Kay/F&A/*'), '~/Nextcloud/_Kay/F&A/_IN')
    move(dir('~/G-Drive/_IN/Kay/Ops/*'), '~/Nextcloud/_Kay/Ops/_IN')
    move(dir('~/G-Drive/_IN/Nexus/F&A/*'), '~/Nextcloud/_Nexus/F&A/_IN')
    move(dir('~/G-Drive/_IN/Bricks/Cadiz50/*'), '~/Nextcloud/_Bricks/Cadiz50/_IN')
    move(dir('~/G-Drive/_IN/Bricks/Viaduct132/*'), '~/Nextcloud/_Bricks/Viaduct132/_IN')
    move(dir('~/G-Drive/_IN/Bricks/London993/*'), '~/Nextcloud/_Bricks/London993/_IN')
    move(dir('~/G-Drive/_IN/Bricks/Walen25/*'), '~/Nextcloud/_Bricks/Walen25/_IN')
    move(dir('~/G-Drive/_IN/Personal/*'), '~/Nextcloud/_Personal/_IN')
  end

  # E-mail attachment are automatically saved to a flat folder. 
  # This rules organizes these files into subdirectories by some common file types. 
  rule 'Organize e-mail attachments by file extension' do
    {
      '3cxconfig' => 'Settings',
      'pdf'  => 'PDF',
      'PDF'  => 'PDF',
      'zip'  => 'Archives',
      'vcf'  => 'Contacts',
      'html' => 'Text',
      'htm'  => 'Text',
      'txt'  => 'Text',
      'doc'  => 'Documents',
      'docx' => 'Documents',
      'xls'  => 'Spreadsheets',
      'xlsx' => 'Spreadsheets',
      'pptx' => 'Presentations',
      'jpg' => 'Images',
      'JPG' => 'Images',
      'png' => 'Images',
      'PNG' => 'Images',
      'gif' => 'Images',
      'GIF' => 'Images',
    }.each do |ext, directory|
      ext_path = "~/Nextcloud/Mail Att/#{ directory }"

      dir("~/Nextcloud/Mail Att/*.#{ ext }").each do |path|
          mkdir(ext_path)
          move(path, ext_path)
      end
    end
  end  
  
end
