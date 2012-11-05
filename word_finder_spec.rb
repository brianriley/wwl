require_relative "word_finder"

describe WordFinder do
  it "returns ox, o, and x when given the letters x and o" do
    word_finder = WordFinder.new
    word_finder.find("xo").should eq(["oxo", "ox", "oo"])
  end
end
