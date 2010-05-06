def outdated_packages(&block)
  require 'formula'
  result = []
  HOMEBREW_CELLAR.subdirs.each do |keg|
    if keg.subdirs.length > 0
      name = keg.basename('.rb').to_s
      if (not (f = Formula.factory(name)).installed? rescue nil)
        result << [keg, name, f.version]
      end
    end
  end
  return result
end
