module FileHelpers

  def read_yaml_file(sub_dir, filename)
    full_path = set_path(sub_dir, filename)
    return YAML.load_file(full_path)
  end

  def write_yaml_file(item, sub_dir, filename)
    full_path = set_path(sub_dir, filename)
    File.open(full_path, "w+") do |f|
      f.write(item.to_yaml)
    end
  end

  def read_text_file(sub_dir, filename)
    text = ""
    full_path = set_path(sub_dir, filename)
    File.open(full_path, "r") do |f|
      text = f.read
    end
    return text
  end

  def write_text_file(item, sub_dir, filename)
    full_path = set_path(sub_dir, filename)
    File.open(full_path, "w+") do |f|
      f.write(item)
    end
  end

  def string_between_markers(text, marker1, marker2)
    return text[/#{Regexp.escape(marker1)}(.*?)#{Regexp.escape(marker2)}/m, 1]
  end

private

  def set_path(sub_dir, filename)
    return File.join root_dir, partial_path(sub_dir, filename)
  end

  def partial_path(sub_dir, filename)
    return "fixtures/#{sub_dir}/#{filename}"
  end

  def root_dir
    File.dirname __dir__
  end

end