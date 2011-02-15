Factory.sequence :subtext_cycle do |n|
  subtexts = ["love", "hate"]
  @sub_index ||= 0
  @sub_index = @sub_index > subtexts.length ? 0 : @sub_index + 1
  subtexts[@sub_index]
end

Factory.define :subtext do |st|
  st.subtext "I #{Factory.next(:subtext_cycle)} it when"
end
