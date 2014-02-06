class DataDisplayer

  def self.output(user_data)
    user_data.join("\n") << "\n"
  end
end
