Facter.add(:majdistrelease) do
  setcode do
    Facter.value('operatingsystemrelease').split('.')[0]
  end
end

Facter.add(:mindistrelease) do
  setcode do
    Facter.value('operatingsystemrelease').split('.')[1]
  end
end