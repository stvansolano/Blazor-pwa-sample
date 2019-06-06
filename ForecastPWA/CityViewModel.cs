using System.ComponentModel;

namespace ForecastPWA
{
    public class CityViewModel : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;

        private string _city = string.Empty;

        public string City
        {
            get => _city;
            set
            {
                if (value != _city)
                {
                    _city = value;
                    PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(nameof(City)));
                }
            }
        }
    }
}
