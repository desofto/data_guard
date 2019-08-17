class GroupsGenerator
  class << self
    def run(count)
      new(count).run
    end
  end

  def initialize(groups_count = 3)
    @groups_count = groups_count
  end

  def run
  end
end
