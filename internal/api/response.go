package api

import (
	"github.com/xralf/hex/internal/domain/cart"
)

type Cart struct {
	Id    string         `json:"id"`
	Items map[string]int `json:"items"`
}

func newCartResponse(c *cart.Cart) *Cart {
	return &Cart{
		Id:    c.Id,
		Items: c.Items(),
	}
}
