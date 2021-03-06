
module AdminToolsEnnder
  # :stopdoc:
  LIBPATH = ::File.expand_path(::File.dirname(__FILE__)) + ::File::SEPARATOR
  PATH = ::File.dirname(LIBPATH) + ::File::SEPARATOR

  @debug = false
  if @debug
    puts "  admin_tools_ennder LIBPATH=#{LIBPATH}"
    puts "    PATH=#{PATH}"
  end if
  # :startdoc:

  # Returns the version string for the library.
  #
  def self.version
    @version ||= File.read(path('VERSION')).strip
  end

  # Returns the library path for the module. If any arguments are given,
  # they will be joined to the end of the libray path using
  # <tt>File.join</tt>.
  #
  def self.libpath( *args, &block )
    rv =  args.empty? ? LIBPATH : ::File.join(LIBPATH, args.flatten)
    if block
      begin
        $LOAD_PATH.unshift LIBPATH
        rv = block.call
      ensure
        $LOAD_PATH.shift
      end
    end

    puts "  self.libpath ->#{rv}" if @debug
    return rv
  end

  # Returns the lpath for the module. If any arguments are given,
  # they will be joined to the end of the path using
  # <tt>File.join</tt>.
  #
  def self.path( *args, &block )
    rv = args.empty? ? PATH : ::File.join(PATH, args.flatten)
    if block
      begin
        $LOAD_PATH.unshift PATH
        rv = block.call
      ensure
        $LOAD_PATH.shift
      end
    end

    puts "  self.path ->#{rv}" if @debug
    return rv
  end

  # Utility method used to require all files ending in .rb that lie in the
  # directory below this file that has the same name as the filename passed
  # in. Optionally, a specific _directory_ name can be passed in such that
  # the _filename_ does not have to be equivalent to the directory.
  #
  def self.require_all_libs_relative_to( fname, dir = nil )
    dir ||= ::File.basename(fname, '.*')
    puts "  self.require_all_libs_relative_to, dir=#{dir}" if @debug
    search_me = ::File.expand_path(
        ::File.join(::File.dirname(fname), dir, '**', '*.rb'))

    puts "    search_me=#{search_me}" if @debug
    Dir.glob(search_me).sort.each {|rb|
      puts "    require #{rb}" if @debug
      require rb
    }
  end
end  # module AdminToolsEnnder

AdminToolsEnnder.require_all_libs_relative_to(__FILE__)
