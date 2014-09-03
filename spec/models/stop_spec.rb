describe Stop do
  it { should validate_numericality_of :station_id }
  it { should validate_numericality_of :line_id }
  it { should belong_to :station }
  it { should belong_to :line }
end
