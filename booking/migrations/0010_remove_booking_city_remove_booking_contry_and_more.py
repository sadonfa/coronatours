# Generated by Django 4.2.2 on 2025-02-03 16:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('booking', '0009_booking_date_ret_booking_destino_ret_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='booking',
            name='city',
        ),
        migrations.RemoveField(
            model_name='booking',
            name='contry',
        ),
        migrations.RemoveField(
            model_name='booking',
            name='lastname',
        ),
        migrations.AddField(
            model_name='booking',
            name='air_r',
            field=models.CharField(default='None', max_length=200, verbose_name='Aerolinea retorno'),
        ),
        migrations.AddField(
            model_name='booking',
            name='nair_r',
            field=models.CharField(default='None', max_length=200, verbose_name='numero de vuelo retorno'),
        ),
    ]
