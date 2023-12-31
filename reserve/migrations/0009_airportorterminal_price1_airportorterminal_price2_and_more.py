# Generated by Django 4.2.1 on 2023-06-26 17:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('reserve', '0008_remove_hotellist_zona_ind_hotellist_price1_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='airportorterminal',
            name='price1',
            field=models.CharField(blank=True, max_length=300, null=True, verbose_name='Valor de Auto estandar'),
        ),
        migrations.AddField(
            model_name='airportorterminal',
            name='price2',
            field=models.CharField(blank=True, max_length=300, null=True, verbose_name='Valor de Van estandar'),
        ),
        migrations.AlterField(
            model_name='hotellist',
            name='price1',
            field=models.CharField(blank=True, max_length=300, null=True, verbose_name='Valor de Auto estandar'),
        ),
        migrations.AlterField(
            model_name='hotellist',
            name='price2',
            field=models.CharField(blank=True, max_length=300, null=True, verbose_name='Valor de Van estandar'),
        ),
    ]
