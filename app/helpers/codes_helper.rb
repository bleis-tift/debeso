# Helper methods defined here can be accessed in any controller or view in the application

#Debeso.helpers do
module CodesHelper
   def ext2lang(ext)
     return nil if ext.blank?
     map = {'c' => 'clike',
       'h' => 'clike',
       'java' => 'clike',
       'cpp' => 'clike',
       'hpp' => 'clike',
       'cs' => 'clike',
       'clj' => 'clojure',
       'coffee' => 'coffeescript',
       'css' => 'css',
       'diff' => 'diff',
       'patch' => 'diff',
       'groovy' => 'groovy',
       'hs' => 'haskell',
       'html' => 'html',
       'htm' => 'html',
       'js' => 'javascript',
       'jinja2' => 'jinja2',
       'lua' => 'lua',
       'md' => 'markdown',
       'markdown' => 'markdown',
       'nt' => 'ntriples',
       'pas' => 'pascal',
       'pp' => 'pascal',
       'p' => 'pascal',
       'pl' => 'perl',
       'php' => 'php',
       'sql' => 'plsql',
       'py' => 'python',
       'r' => 'r',
       'rst' => 'rst',
       'rb' => 'ruby',
       'scm' => 'scheme',
       'st' => 'smalltalk',
       'sparql' => 'sparql', # XXX
       'tex' => 'stex',
       'vm' => 'velocity',
       'xml' => 'xmlpure',
       'yml' => 'yaml',
       'yaml' => 'yaml'}
     map[ext.downcase]
   end

   def get_lines(content, num)
     lines = content.rstrip.split(/\r?\n/)
     if lines.size < num
       lines.join("\n")
     else
       lines[0..(num - 1)].join("\n")
     end
   end

   def message_tags
     tags = ''
     [:info, :error, :warning].each do |level|
       if flash[level].class == String
         tags << message_tag(level, flash[level])
       elsif flash[level].class == Array
         flash[level].each do |message|
           tags << message_tag(level, message)
         end
       end
     end
     tags
   end

   def message_tag(level, message)
     tag = ''
     tag << "<div>"
     tag << "<span class='label #{level.to_s}'>#{level}</span>"
     tag << "<span class='message'>#{message}</span>"
     tag << "</div>"
     tag
   end
end
